# app/ui/hmac_page.py

from PySide6.QtWidgets import (
    QWidget, QLabel, QPushButton, QTextEdit, QVBoxLayout, QHBoxLayout,
    QComboBox, QRadioButton, QButtonGroup, QFileDialog, QScrollArea
)
from app.core.packet_builder import build_packet
from app.core.packet_parser import parse_packet
from app.core.device_comm import DeviceInterface
from app.utils.clipboard_utils import copy_to_clipboard
from app.utils.file_utils import save_text_to_file
from app.core.logger import log

class HMACPage(QWidget):
    def __init__(self, device):
        super().__init__()
        self.device = DeviceInterface()

        self.hash_dropdown = QComboBox()
        self.hash_dropdown.addItems(["SHA224", "SHA256"])

        self.key_state_group = QButtonGroup(self)
        self.byok_radio = QRadioButton("BYOK")
        self.gyok_radio = QRadioButton("GYOK")
        self.daba_radio = QRadioButton("DABA")
        self.key_state_group.addButton(self.byok_radio)
        self.key_state_group.addButton(self.gyok_radio)
        self.key_state_group.addButton(self.daba_radio)
        self.byok_radio.setChecked(True)

        self.key_input = QTextEdit()
        self.key_input.setPlaceholderText("Enter 16-byte Key or 4-byte Key ID")
        self.key_input.setFixedHeight(30)

        self.input_field = QTextEdit()
        self.input_field.setPlaceholderText("Enter plaintext or choose a file")

        self.upload_btn = QPushButton("Upload File")
        self.upload_btn.clicked.connect(self.load_file)

        self.generate_btn = QPushButton("Generate HMAC")
        self.generate_btn.clicked.connect(self.generate_hmac)

        self.keyid_output = QTextEdit()
        self.keyid_output.setReadOnly(True)
        self.keyid_copy = QPushButton("Copy")
        self.keyid_copy.clicked.connect(lambda: copy_to_clipboard(self.keyid_output.toPlainText()))
        self.keyid_save = QPushButton("Download")
        self.keyid_save.clicked.connect(lambda: save_text_to_file(self.keyid_output.toPlainText(), "hmac_keyid.txt"))

        self.digest_output = QTextEdit()
        self.digest_output.setReadOnly(True)
        self.digest_copy = QPushButton("Copy")
        self.digest_copy.clicked.connect(lambda: copy_to_clipboard(self.digest_output.toPlainText()))
        self.digest_save = QPushButton("Download")
        self.digest_save.clicked.connect(lambda: save_text_to_file(self.digest_output.toPlainText(), "hmac_digest.txt"))

        # Layouts
        layout = QVBoxLayout()
        layout.addWidget(QLabel("Select Hash Algorithm:"))
        layout.addWidget(self.hash_dropdown)

        layout.addWidget(QLabel("Select Key State:"))
        layout.addWidget(self.byok_radio)
        layout.addWidget(self.gyok_radio)
        layout.addWidget(self.daba_radio)
        layout.addWidget(self.key_input)

        layout.addWidget(QLabel("Plaintext Input:"))
        layout.addWidget(self.input_field)
        layout.addWidget(self.upload_btn)
        layout.addWidget(self.generate_btn)

        layout.addWidget(QLabel("Key ID:"))
        layout.addWidget(self.keyid_output)
        btn_row1 = QHBoxLayout()
        btn_row1.addWidget(self.keyid_copy)
        btn_row1.addWidget(self.keyid_save)
        layout.addLayout(btn_row1)

        layout.addWidget(QLabel("Digest (Hex):"))
        layout.addWidget(self.digest_output)
        btn_row2 = QHBoxLayout()
        btn_row2.addWidget(self.digest_copy)
        btn_row2.addWidget(self.digest_save)
        layout.addLayout(btn_row2)

        container = QWidget()
        container.setLayout(layout)
        scroll = QScrollArea()
        scroll.setWidgetResizable(True)
        scroll.setWidget(container)

        outer_layout = QVBoxLayout(self)
        outer_layout.addWidget(scroll)

    def load_file(self):
        path, _ = QFileDialog.getOpenFileName(self, "Open File")
        if path:
            with open(path, "rb") as f:
                self.input_field.setPlainText(f.read().hex(" "))

    def generate_hmac(self):
        try:
            option = 0x31 if self.hash_dropdown.currentText() == "SHA224" else 0x32
            key_state = 0xB1 if self.byok_radio.isChecked() else 0xB2
            key_data = bytes.fromhex(self.key_input.toPlainText().strip())
            if self.daba_radio.isChecked():
                key_state = 0xB2  # Reusing same flag for DABA
                key_data = key_data.ljust(16, b"\x00")
            elif self.gyok_radio.isChecked():
                key_data = b"\x00" * 16

            plaintext = bytes.fromhex(self.input_field.toPlainText().strip())
            input_size = len(plaintext) + 17
            full_input = bytes([key_state]) + key_data + plaintext

            packet, txid = build_packet(0x04, option, full_input)
            self.device.send(packet)
            response = self.device.receive()
            output = parse_packet(response, txid)

            keyid = output[:4]
            digest = output[4:]

            self.keyid_output.setPlainText(" ".join(f"{b:02X}" for b in keyid))
            self.digest_output.setPlainText(" ".join(f"{b:02X}" for b in digest))

            log("HMAC operation successful.")
        except Exception as e:
            log(f"HMAC Error: {e}")
            self.digest_output.setPlainText(f"Error: {e}")

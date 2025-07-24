import subprocess

def run_scan(url):
    result = ""

    # Nuclei (يحتاج تنصيبه في السيرفر - جاهز في Render Build)
    try:
        nuclei_output = subprocess.check_output(
            ["nuclei", "-u", url, "-silent"],
            stderr=subprocess.DEVNULL
        ).decode()
        result += "\n[Nuclei Results]\n" + nuclei_output
    except:
        result += "\n[Nuclei] not found or error.\n"

    # Dalfox (فحص XSS)
    try:
        dalfox_output = subprocess.check_output(
            ["dalfox", "url", url],
            stderr=subprocess.DEVNULL
        ).decode()
        result += "\n[Dalfox Results]\n" + dalfox_output
    except:
        result += "\n[Dalfox] not found or error.\n"

    return result or "لم يتم العثور على نتائج."

class CertificatePdf < Prawn::Document
  def initialize
    super(top_margin: 20)

    certificate_header

    text "1. The name of the corporation shall be TEST"
   	text "2. Its registered office in the State of Delaware is located at Registered Agent Street, In the city of Registered Agent City, County of County, Zip Code 00000 and its Registered Agent at such address is Registered Agent Name."
	text "3. The purpose of the corporation shall be to carry on any and all business and to engage in any lawful act or activity for which corporations may be organized under the General Corporation Law of Delaware."
	text "4. The total number of shares of stock which this corporation is authorized to issue is fsvs with a par value of $ vsvvs per share."
	text "5. The powers, preferences and rights and the qualifications, limitations or restrictions thereof shall be determined by the board of directors."
	text "6. The name and address of the incorporator is Lextronica, Inc., 395 Page Mill Rd., 94306 Palo Alto, CA."
	text "7. The Board of Directors shall have the power to adopt, amend or repeal by by-laws."
	text "8. No director shall be personally liable to the Corporation or its stockholders for monetary damages for any breach of fiduciary duty by such director as a director. Notwithstanding the foregoing sentence, a director shall be liable to the extent provided by applicable law, (i) for breach of the director's duty of loyalty to the Corporation or its stockholders, (ii) for acts or omissions not in good faith or which involve intentional misconduct or a knowing violation of law, (iii) pursuant to Section 174 of the Delaware General Corporation Law or (iv) for any transaction from which the director derived an improper personal benefit. No amendment to or repeal of this Article Eighth shall apply to or have any effect on the liability or alleged liability of any director of the Corporation for or with respect to any acts or omissions of such director occurring prior to such amendment."
	text  "IN WITNESS WHEREOF, the undersigned, being the incorporator herein before named, has executed signed and acknowledged this certificate of incorporation on February 10 of the year 2013"

	end
end

def certificate_header

    text "STATE of DELAWARE", :align => :center
    text "CERTIFICATE of INCORPORATION", :align => :center
    text "Name"
end
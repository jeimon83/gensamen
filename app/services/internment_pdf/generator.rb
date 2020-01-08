class InternmentPdf::Generator < Prawn::Document

  def initialize(internment: internment)
    super({ page_size: 'A4' })
    @internment = Internment.find(internment.id)
    @patient = Patient.find_by(id: @internment)
    @clinic = Clinic.find(@patient.clinic_id)
  end

  def generate
    header
    clinic_info
    patient_info
    internment_info
  end

  def header
    stroke_color 'ff0000'
    line_width 1.5
    font_size 16
    text "GENSAMEN - DATOS DE INTERNACION"
    move_down 4
    stroke_horizontal_rule
  end

  def clinic_info
    move_down 20
    font_size 12
    text "#{@clinic.name} - Cuit: #{@clinic.cuit}"
  end

  def patient_info
    move_down 10
    text "Paciente: #{@patient.full_name} "
  end

  def internment_info
    move_down 10
    text "Fecha de Internación: #{@internment.begin_date.strftime("%d-%m-%Y")}"
  end
end

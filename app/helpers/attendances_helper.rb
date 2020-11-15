module AttendancesHelper
	
	def attendance_state(attendance)
		#受け取ったAttendancdオブジェクトが当時と一致するか評価します。
		if Date.current == attendance.worked_on
			return "出社" if attendance.started_at.nil?
			return "退社" if attendance.started_at.present? && attendance.finished_at.nil?
		end
		#どれにも当てはまらなかった場合はfalseを返す。
		false
	end
end
		

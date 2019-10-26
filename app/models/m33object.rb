class M33object < ActiveRecord::Base
  belongs_to :m33brick, foreign_key: "brick"

	#Interpreted Values
	def prioritycolor
          if (self.viewfrac > 0.35 and self.gfrac < 0.5)
            bckcolor="BGCOLOR='green'"
          elsif (self.viewfrac > 0.35)
            bckcolor="BGCOLOR='red'"
          else
            bckcolor="BGCOLOR='yellow'"
          end
          bckcolor
	end

	def altidcolor
          if (self.altflag == 1)
            bckcolor="BGCOLOR='green'"
          elsif (self.altflag == 0 and self.altid != nil)
            bckcolor="BGCOLOR='red'"
          else
            bckcolor=""
          end
          bckcolor
	end

	def absmag
          if self.mag475 != nil
            absmag = sprintf("%.2f",self.mag475 - 24.67)
          else
            absmag = -999
          end
          absmag
	end

	def obsmag
          if self.mag475 != nil
            obsmag = sprintf("%.2f",self.mag475)
          else
            obsmag = -999
          end
          obsmag
	end

	def optcolor
          if (self.mag475 != nil && self.mag814 != nil)
            optcolor = sprintf("%.2f",self.mag475-self.mag814)
	  else
            optcolor = -999
	  end
          optcolor
	end

	def radangular
          rad = sprintf("%.2f",self.pixrad*0.05)
	end

	def halfangular
          if self.pixhlr475 != nil
            rad = sprintf("%.2f",self.pixhlr475*0.05)
          else
            rad = -999
          end
          rad
	end

	def halfphysical
          if self.pixhlr475 != nil
            rad = self.pixhlr475*0.05
            arcpc = 0.2625 #Math::tan(1.0/(0.78*1000000.0))*206265.0
            hlrad = sprintf("%.2f",rad/arcpc)
          else
            hlrad = -999
          end
          hlrad
	end

  #Image Filename Assignment
	def fileid
          name = 'lgcs-m33_'+self.id.to_s
	end

	def image_color
          path = WEB_URL+IMAGE_DIR_M33+'/'+self.fileid+'_color.jpg'
        end

 	def image_275
          path = WEB_URL+IMAGE_DIR_M33+'/'+self.fileid+'_F275W.jpg'
        end

  	def image_336
          path = WEB_URL+IMAGE_DIR_M33+'/'+self.fileid+'_F336W.jpg'
        end

	def image_475
          path = WEB_URL+IMAGE_DIR_M33+'/'+self.fileid+'_F475W.jpg'
        end

 	def image_814
          path = WEB_URL+IMAGE_DIR_M33+'/'+self.fileid+'_F814W.jpg'
        end

 	def image_110
          path = WEB_URL+IMAGE_DIR_M33+'/'+self.fileid+'_F110W.jpg'
        end

  	def image_160
          path = WEB_URL+IMAGE_DIR_M33+'/'+self.fileid+'_F160W.jpg'
        end

        def cmd_image
          path = WEB_URL+CMD_DIR_M33+'/'+self.fileid+'_cmd.png'
	end

        def sed_image
          path = WEB_URL+'/seds_m33/'+self.fileid+'_sed.png'
	end

	def fit_cmd
          path = WEB_URL+'/'+self.fileid+'_cmd.png'
	end

	def fit_res
          path = WEB_URL+'/'+self.fileid+'_out.cmd_WFC.png'
	end

	def fit_pdf
          path = WEB_URL+'/'+self.fileid+'_pdf.png'
	end

	def intfit_pdf
          path = WEB_URL+'/lgcs-m33_intpdf_m33/'+self.fileid+'_pdf1d.png'
	end

	def intfit_pdf2d
          path = WEB_URL+'/lgcs-m33_intpdf_m33/'+self.fileid+'_pdf2d.png'
	end

end

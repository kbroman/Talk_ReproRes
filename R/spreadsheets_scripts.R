# spreadsheet examples related to "everything with a script"
library(broman)

hilit_color <- "#ff0080"

# 1. a few values in g where the rest are in mg

mat <- cbind(id=paste0("DO-", 121:130),
             "Rt Kidney wt"=c(294, 296, "NA", 513, 381,
                              225, 262, 231, 263, 266),
             "Rt Adipose wt"=c(757, 583, 834, 808, 780,
                               1.066, 1.03, 0.687, 0.932, 985),
             "Liver wt"=c(930, 439, 527, 600, 493,
                          355, 512, 497, 580, 906))

pdf("../Figs/spreadsheet_g_v_mg.pdf", height=5, width=10)
excel_fig(mat, col_names=TRUE)
dev.off()

pdf("../Figs/spreadsheet_g_v_mg_hilit.pdf", height=5, width=10)
excel_fig(mat, col_names=TRUE, hilitcells=paste0("C", 7:10), hilitcolor=hilit_color)
dev.off()


# 2. spreadsheets with differing column values
mat1 <- cbind(id=paste0("DO-", 121:130),
              "glucose.mg.dl.0"=
                  c(99.165552,185.801584,198.455624,263.25608,192.393456,
                    154.019344,102.5792,117.175488,89.984016,122.060536),
              "glucose.mg.dl.5"=
              c(349.303552, 297.39256, 530.638888, 597.734728, 456.421472,
                329.351368, 220.232344, 377.789856, 257.193912, 290.859544),
              "glucose.mg.dl.15"=
              c(286.092208, 439.000096, 614.155552, 568.189016, 653.76564,
                482.49468, 265.897792, 371.315696, 172.146992, 270.966216),
              "glucose.mg.dl.30"=
                  c(312.047704, 362.251872, 647.468048, 552.886456, 744.345024,
                    431.407672, 202.693256, 431.996232, 221.056328, 247.65924))

mat2 <- cbind(id=paste0("DO-", 221:230),
              "glucose.0"=
              c(145.742786, 138.010378, 138.219362, 100.445504, 121.030428,
                118.418128, 117.4777, 98.773632, 122.44107, 129.024066),
              "glucose.5"=
              c(206.452638, 342.866944, 407.443, 310.944638, 290.41196,
                189.524934, 395.321928, 149.452252, 260.63174, 417.317494),
              "glucose.15"=
              c(216.640608, 339.836676, 336.858654, 384.97722, 345.740474,
                159.692468, 448.612848, 245.637138, 231.008258, 294.173672),
              "glucose.30"=
                  c(299.55501, 276.148802, 235.501414, 308.907044, 313.818168,
                    144.488882, 310.369932, 317.423142, 202.272958, 275.52185))
mat3 <- cbind(id=paste0("DO-", 321:330),
              "glucose.0"=
              c(66.839405, 98.12509, 94.68305, 121.051535, 122.95695,
                201.447755, 130.025425, 143.60919, 125.29262, 135.61874),
              "insulin.0"=
                  c(0.04, 0.51185, 1.7812, 0.0882, 0.19155,
                    0.7454, 0.0509, 0.23435, 0.04, 0.91275),
              "glucose.5"=
              c(246.685995, 246.25574, 448.1068, 407.355505, 298.193665,
                386.51887, 477.302675, 438.88705, 543.74634, 393.03416),
              "insulin.5"=
                  c(0.04, 1.4062, 1.0248, 0.63475, 0.6467,
                    0.6081, 0.166, 0.70505, 1.7366, 3.73095))

pdf("../Figs/spreadsheet_colnames1.pdf", height=5, width=8.5)
excel_fig(mat1, col_names=TRUE)
dev.off()

pdf("../Figs/spreadsheet_colnames2.pdf", height=5, width=8.5)
excel_fig(mat2, col_names=TRUE)
dev.off()


# 3. spreadsheets with differing order of columns
pdf("../Figs/spreadsheet_colnames3.pdf", height=5, width=8.5)
excel_fig(mat3, col_names=TRUE)
dev.off()

# 4. metadata file useful for scripts
metadata <- cbind(short_name= c("mouse", "sex", "sac_date", "num_islets",
                                "Ins_per_islet", "Glu_0min", "Ins_0min",
                                "Glu_tAUC", "Glu_iAUC", "Ins_tAUC"),
                  file=rep(c("wave2_sheet1.csv","ex_vivo_waves1-3.csv", "gtt2.csv"), c(3,2,5)),
                  from_column=c("mouse #", "sex", "sac date", "# islets", "IC",
                                "glucose.mg.dl.0", "insulin.ng.ml.0",
                                "glucose.mg.dl.tAUC", "glucose.mg.dl.iAUC",
                                "insulin.ng.ml.tAUC"),
                  id_column=rep(c("mouse", "id"), c(5,5)),
                  column_offset=rep(0,10))


pdf("../Figs/file_metadata_example.pdf", height=5, width=10, pointsize=10)
excel_fig(metadata, col_names=TRUE)
dev.off()

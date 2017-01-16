package entity.articles;

/**
 * @author dandi
 */

public class TextBook extends Book {
    private String materia;
    private int edizione;

    public String getMateria() {
        return materia;
    }

    public void setMateria(String materia) {
        this.materia = materia;
    }

    public int getEdizione() {
        return edizione;
    }

    public void setEdizione(int edizione) {
        this.edizione = edizione;
    }
}

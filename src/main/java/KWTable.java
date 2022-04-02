import java.util.Hashtable;

public class KWTable {
    private Hashtable mTable;
    public KWTable()
    {
        // Inicijalizcaija hash tabele koja pamti kljucne reci
        mTable = new Hashtable();
        mTable.put("main", Integer.valueOf(Sym.MAIN));
        mTable.put("real", Integer.valueOf(Sym._real));
        mTable.put("int", Integer.valueOf(Sym._int));
        mTable.put("char", Integer.valueOf(Sym._char));
        mTable.put("read", Integer.valueOf(Sym.read));
        mTable.put("write", Integer.valueOf(Sym.write));
        mTable.put("for", Integer.valueOf(Sym._for));
        mTable.put("in", Integer.valueOf(Sym.in));
    }

    /**
     * Vraca ID kljucne reci
     */

    public int find(String keyword)
    {
        Object symbol = mTable.get(keyword);
        if (symbol != null)
            return ((Integer)symbol).intValue();

        // Ako rec nije pronadjena u tabeli kljucnih reci radi se o identifikatoru
        return Sym.ID;
    }
}

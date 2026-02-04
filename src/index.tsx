import styles from "./Kanza.module.css";

interface KanzaProps {}

export function Kanza(_props: KanzaProps) {
  return (
    <div className={styles.container}>
      <div className={styles.scanlines} />
      <div className={styles.inputWrapper}>
        <span className={styles.prompt}>&gt;</span>
        <input 
          className={styles.terminalInput} 
          autoFocus 
          spellCheck="false" 
          autoComplete="off"
        />
      </div>
    </div>
  );
}

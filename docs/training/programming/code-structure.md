# Code Structure
## About
For all projects created on or after 01-06-2025, KendirStudios will adhere to the [Official Unity C# Coding Style](https://unity.com/resources/c-sharp-style-guide-unity-6).

A more detailed explanation can be found in the ebook below.

- [Clean Unity Code](https://kendirstudios.pt/Files/KendirStudiosDeveloperDocumentation/programming/ebooks-pdfs/Use_a_C__style_guide.pdf)

## Cheatsheet
### Variables
```
public int MyVariable;
public int ObjectID { get; }

private int m_myVariable;

public const int k_MyVariable;
private const int k_MyVariable;

public static int s_MyVariable;
private static int s_MyVariable;
```
### Enums
```
public enum WeaponType
{
    Knife,
    Gun,
    RocketLauncher,
    BFG
}

public enum FireMode
{
    None = 0,
    Single = 5,
    Burst = 7,
    Auto = 8,
}

[Flags]
public enum AttackModes
{
    // Decimal // Binary
    None = 0, // 000000
    Melee = 1, // 000001
    Ranged = 2, // 000010
    Special = 4, // 000100
}
```

### Event Args
```
public struct CustomEventArgs
{
    public int ObjectID { get; }
    public Color Color { get; }

    public CustomEventArgs(int objectId, Color color)
    {
        this.ObjectID = objectId;
        this.Color = color;
    }
} 
```

### Namespaces
```
namespace Enemy 
```

### Structs
```
public struct PlayerStats
{
    public int MovementSpeed;
    public int HitPoints;
    public bool HasHealthPotion;
}
```

### Formatting
#### Properties
```
public class PlayerHealth
{
    // the private backing field
    private int m_maxHealth;
    // read-only, returns backing field
    public int MaxHealth => m_maxHealth;
    // equivalent to:
    // public int MaxHealth { get; private set; }
}
```
Use properties on basic get/set operations. On complex logic use methods instead.
```
public class PlayerHealth
{
    private int m_maxHealth;

    public int GetMaxHealth
    {
        return m_maxHealth;
    }
} 
```

#### Brace or indentation style
Use
```
void DisplayMouseCursor(bool showMouse)
{
    if (!showMouse)
    {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }
    else
    {
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
    }
}
```
Avoid
```
void DisplayMouseCursor(bool showMouse){
    if (!showMouse) {
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }
    else {
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
    }
}
```
Use 
```
// EXAMPLE: keep braces for clarity...
for (int i = 0; i < 100; i++) { DoSomething(i); }
// … and/or keep the clause on a separate line.
for (int i = 0; i < 100; i++)
{
    DoSomething(i);
}
```
Avoid
```
for (int i = 0; i < 100; i++) DoSomething(i);

for (int i = 0; i < 10; i++)
    for (int j = 0; j < 10; j++)
        ExampleAction();
```

#### Horizontal spacing
```
// EXAMPLE: add spaces to make lines easier to read
for (int i = 0; i < 100; i++) { DoSomething(i); }
// AVOID: no spaces
for(inti=0;i<100;i++){DoSomething(i);} 
```
```
// EXAMPLE: single space after comma between arguments
CollectItem(myObject, 0, 1);
// AVOID: leaving out spacing
CollectItem(myObject,0,1); 
```
```
// EXAMPLE: no space after the parenthesis and function arguments
DropPowerUp(myPrefab, 0, 1);
//AVOID:
DropPowerUp( myPrefab, 0, 1 ); 
```
```
// EXAMPLE: omit spaces between a function name and parenthesis.
DoSomething()
// AVOID
DoSomething () 
```
```
// EXAMPLE: omit spaces inside brackets
x = dataArray[index];
// AVOID
x = dataArray[ index ];
```
```
// EXAMPLE: space before condition; separate parentheses with a space.
while (x == y)
// AVOID
while(x==y)
```
```
// EXAMPLE: space before condition; separate parentheses with a space.
if (x == y)
// AVOID
if (x==y)
```
```
// EXAMPLE: One space between type and name
    public float Speed = 12f;
    public float Gravity = -10f;
    public float JumpHeight = 2f;
    public Transform GroundCheck;
    public float GroundDistance = 0.4f;
    public LayerMask GroundMask;
// AVOID: column alignment
    public float            Speed = 12f;
    public float            Gravity = -10f;
    public float            JumpHeight = 2f;
    public Transform        GroundCheck;
    public float            GroundDistance = 0.4f;
    public LayerMask        GroundMask;
```

### Classes
Organize scripts with this structure:
```
— Fields
— Properties
— Events / Delegates
— Monobehaviour Methods (Awake, Start, OnEnable, OnDisable, OnDestroy, etc.)
— Public Methods
— Private Methods
```

### Methods
```
// EXAMPLE: Define an extension method
public static class TransformExtensions
{
 public static void ResetTransformation(this Transform transform)
 {
 transform.position = Vector3.zero;
 transform.localRotation = Quaternion.identity;
 transform.localScale = Vector3.one;
 }
}

// EXAMPLE: Calling the extension method
public class ResetOnStart : MonoBehaviour
{
 void Start()
 {
 transform.ResetTransformation();
 }
}
```

DRY principle: Don't repeat yourself 

*I'm looking at you Heitor*
```
// DON'T
// EXAMPLE: WRITE EVERYTHING TWICE
private void PlayExplosionA(Vector3 hitPosition)
{
    explosionA.transform.position = hitPosition;
    explosionA.Stop();
    explosionA.Play();
    AudioSource.PlayClipAtPoint(soundA, hitPosition);
}
private void PlayExplosionB(Vector3 hitPosition)
{
    explosionB.transform.position = hitPosition;
    explosionB.Stop();
    explosionB.Play();
    AudioSource.PlayClipAtPoint(soundB, hitPosition);
} 

// USE THIS INSTEAD!
private void PlayFXWithSound(ParticleSystem particle, AudioClip
clip, Vector3 hitPosition)
{
    particle.transform.position = hitPosition;
    particle.Stop();
    particle.Play();
    AudioSource.PlayClipAtPoint(clip, hitPosition);
} 
```
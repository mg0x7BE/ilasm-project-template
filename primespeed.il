.assembly extern mscorlib { }
.assembly primespeed { }
.module primespeed

.class public Program
{
  .method public static void Main() cil managed
  {
    .entrypoint
    .maxstack 4
    .locals init (
      [0] int32 counter,
      [1] int32 number,
      [2] int32 divisor,
      [3] int32 maxcheck,
      [4] int32 lastprime
    )
    
    // Initialize
    ldc.i4.0
    stloc.0          // counter = 0
    ldc.i4.2
    stloc.1          // number = 2
    ldc.i4.2
    stloc.s 4        // lastprime = 2
    
    // Display start message
    ldstr "Starting prime search (trial division) for 10000000 primes..."
    call void [mscorlib]System.Console::WriteLine(string)
    
    // Handle first prime (2) separately
    ldc.i4.1
    stloc.0          // counter = 1
    ldc.i4.3
    stloc.1          // number = 3 (start from first odd)
    
  mainLoop:
    // Calculate sqrt(number) ONCE before checking divisors
    ldloc.1
    conv.r8
    call float64 [mscorlib]System.Math::Sqrt(float64)
    conv.i4
    stloc.3          // maxcheck = sqrt(number)
    
    ldc.i4.3
    stloc.2          // divisor = 3
    
  checkLoop:
    ldloc.2
    ldloc.3
    bgt.s isPrime    // divisor > maxcheck? It's prime!
    
    ldloc.1
    ldloc.2
    rem
    brfalse.s notPrime  // divisible? Not prime!
    
    ldloc.2
    ldc.i4.2
    add
    stloc.2          // divisor += 2 (only odd numbers)
    br.s checkLoop
    
  isPrime:
    ldloc.0
    ldc.i4.1
    add
    stloc.0          // counter++
    
    ldloc.1
    stloc.s 4        // lastprime = number
    
    // Show progress every 1000000 primes
    ldloc.0
    ldc.i4 1000000
    rem
    brtrue.s skipProgress
    
    ldstr "Found: "
    call void [mscorlib]System.Console::Write(string)
    ldloc.0
    call void [mscorlib]System.Console::Write(int32)
    ldstr " primes, last: "
    call void [mscorlib]System.Console::Write(string)
    ldloc.s 4
    call void [mscorlib]System.Console::WriteLine(int32)
    
  skipProgress:
    ldloc.0
    ldc.i4 10000000
    beq.s done       // found 10 million?
    
  notPrime:
    ldloc.1
    ldc.i4.2
    add
    stloc.1          // number += 2 (skip even numbers!)
    br.s mainLoop
    
  done:
    // Display results
    ldstr "===== COMPLETED ====="
    call void [mscorlib]System.Console::WriteLine(string)
    ldstr "Found 10000000 prime numbers!"
    call void [mscorlib]System.Console::WriteLine(string)
    ldstr "The 10000000th prime is: "
    call void [mscorlib]System.Console::Write(string)
    ldloc.s 4
    call void [mscorlib]System.Console::WriteLine(int32)
    ret
  }
}

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
  mainLoop:
    // Check if number is prime
    ldloc.1
    ldc.i4.2
    ble.s isPrime    // 2 is prime
    ldloc.1
    ldc.i4.2
    rem
    brfalse.s notPrime  // if even - not prime
    // Calculate sqrt(number) as limit
    ldloc.1
    conv.r8
    call float64 [mscorlib]System.Math::Sqrt(float64)
    conv.i4
    stloc.3
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
    stloc.s 4        // lastprime = number (save this prime!)
    // Show progress every 1000000 primes
    ldloc.0
    ldc.i4 1000000
    rem
    brtrue.s skipProgress
    // Build progress string with multiple Concat calls
    ldstr "Found: "
    ldloc.0
    box int32
    call string [mscorlib]System.String::Concat(object, object)
    ldstr " primes, last: "
    call string [mscorlib]System.String::Concat(string, string)
    ldloc.s 4
    box int32
    call string [mscorlib]System.String::Concat(object, object)
    call void [mscorlib]System.Console::WriteLine(string)
  skipProgress:
    ldloc.0
    ldc.i4 10000000   // 10 million!
    beq.s done        // found 10 million?
  notPrime:
    ldloc.1
    ldc.i4.1
    add
    stloc.1          // number++
    br.s mainLoop
  done:
    // Display results
    ldstr "===== COMPLETED ====="
    call void [mscorlib]System.Console::WriteLine(string)
    ldstr "Found 10,000,000 prime numbers!"
    call void [mscorlib]System.Console::WriteLine(string)
    ldstr "The 10,000,000th prime is: "
    ldloc.s 4        // show the actual last prime!
    box int32
    call string [mscorlib]System.String::Concat(object, object)
    call void [mscorlib]System.Console::WriteLine(string)
    ret
  }
}

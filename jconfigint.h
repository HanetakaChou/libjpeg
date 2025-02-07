/* libjpeg-turbo build number */
#define BUILD "20250207"

/* Compiler's inline keyword */
#undef inline

#if defined(__GNUC__)
// GCC or Clang

/* How to hide global symbols. */
#define HIDDEN __attribute__((visibility("hidden")))

/* How to obtain function inlining. */
#define INLINE __inline__ __attribute__((always_inline))

/* How to obtain thread-local storage */
#define THREAD_LOCAL __thread

/* Define if your compiler has __builtin_ctzl() and sizeof(unsigned long) == sizeof(size_t) */
#define HAVE_BUILTIN_CTZL 1

#if defined(__aarch64__) || defined(__x86_64__)

/* The size of `size_t', as computed by sizeof. */
#define SIZEOF_SIZE_T 8

#elif defined(__arm__) || defined(__i386__)

/* The size of `size_t', as computed by sizeof. */
#define SIZEOF_SIZE_T 4

#else
#error Unknown Architecture
#endif

#elif defined(_MSC_VER)

#if defined(__clang__)
// Clang-CL

/* How to obtain function inlining. */
#define INLINE __inline__ __attribute__((always_inline))

/* How to obtain thread-local storage */
#define THREAD_LOCAL __thread

#if defined(__aarch64__) || defined(__x86_64__)

/* The size of `size_t', as computed by sizeof. */
#define SIZEOF_SIZE_T 8

#define HAVE_BITSCANFORWARD64

#elif defined(__arm__) || defined(__i386__)

/* The size of `size_t', as computed by sizeof. */
#define SIZEOF_SIZE_T 4

#define HAVE_BITSCANFORWARD

#else
#error Unknown Architecture
#endif

#else
// MSVC

/* How to obtain function inlining. */
#define INLINE __forceinline

/* How to obtain thread-local storage */
#define THREAD_LOCAL __declspec(thread)

#if defined(_M_ARM64) || defined(_M_X64)

/* The size of `size_t', as computed by sizeof. */
#define SIZEOF_SIZE_T 8

#define HAVE_BITSCANFORWARD64

#elif defined(_M_ARM) || defined(_M_IX86)

/* The size of `size_t', as computed by sizeof. */
#define SIZEOF_SIZE_T 4

#define HAVE_BITSCANFORWARD

#else
#error Unknown Architecture
#endif

#endif

/* Define to 1 if you have the <intrin.h> header file. */
#define HAVE_INTRIN_H 1

#else
#error Unknown Compiler
#endif

/* Define to the full name of this package. */
#define PACKAGE_NAME "libjpeg-turbo"

/* Version number of package */
#define VERSION "2.1.5.1"

#if defined(__has_attribute)
#if __has_attribute(fallthrough)
#define FALLTHROUGH __attribute__((fallthrough));
#else
#define FALLTHROUGH
#endif
#else
#define FALLTHROUGH
#endif

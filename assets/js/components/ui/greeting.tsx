export function Greeting({ children }: { children: React.ReactNode }) {
    return (
        <div className="flex flex-col items-center justify-center h-screen bg-gray-100">
            <h1 className="text-[50px]">{children} World!</h1>
        </div>
    );
}
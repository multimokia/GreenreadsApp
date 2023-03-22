//
//  supabaseClient.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-03-21.
//

import Foundation
import Supabase

let client = SupabaseClient(
    supabaseURL: URL(string: "https://xtvhceruqvbbylublzbs.supabase.com")!,
    supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh0dmhjZXJ1cXZiYnlsdWJsemJzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzYyMjU1NzgsImV4cCI6MTk5MTgwMTU3OH0.1cfaqDdoin_9E6pfm4aM2OF2mOR1ocBU15x02mMwbOM"
);

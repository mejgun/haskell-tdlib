-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetBio where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SetBio = 
 SetBio { bio :: String }  -- deriving (Show)

instance T.ToJSON SetBio where
 toJSON (SetBio { bio = bio }) =
  A.object [ "@type" A..= T.String "setBio", "bio" A..= bio ]
-- setBio SetBio  { bio :: String } 


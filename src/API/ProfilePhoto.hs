-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.ProfilePhoto where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.File as File

--main = putStrLn "ok"

data ProfilePhoto = 
 ProfilePhoto { big :: File.File, small :: File.File, _id :: Int }  -- deriving (Show)

instance T.ToJSON ProfilePhoto where
 toJSON (ProfilePhoto { big = big, small = small, _id = _id }) =
  A.object [ "@type" A..= T.String "profilePhoto", "big" A..= big, "small" A..= small, "id" A..= _id ]
-- profilePhoto ProfilePhoto  { big :: File.File, small :: File.File, _id :: Int } 


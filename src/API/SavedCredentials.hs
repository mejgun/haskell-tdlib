-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.SavedCredentials where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data SavedCredentials = 
 SavedCredentials { title :: String, _id :: String }  -- deriving (Show)

instance T.ToJSON SavedCredentials where
 toJSON (SavedCredentials { title = title, _id = _id }) =
  A.object [ "@type" A..= T.String "savedCredentials", "title" A..= title, "id" A..= _id ]
-- savedCredentials SavedCredentials  { title :: String, _id :: String } 


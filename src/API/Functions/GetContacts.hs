-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetContacts where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetContacts = 
 GetContacts -- deriving (Show)

instance T.ToJSON GetContacts where
 toJSON (GetContacts {  }) =
  A.object [ "@type" A..= T.String "getContacts" ]
-- getContacts GetContacts 


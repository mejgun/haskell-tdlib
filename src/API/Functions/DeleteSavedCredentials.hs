-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteSavedCredentials where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeleteSavedCredentials = 
 DeleteSavedCredentials -- deriving (Show)

instance T.ToJSON DeleteSavedCredentials where
 toJSON (DeleteSavedCredentials {  }) =
  A.object [ "@type" A..= T.String "deleteSavedCredentials" ]
-- deleteSavedCredentials DeleteSavedCredentials 


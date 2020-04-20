-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteAccount where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeleteAccount = 
 DeleteAccount { reason :: String }  -- deriving (Show)

instance T.ToJSON DeleteAccount where
 toJSON (DeleteAccount { reason = reason }) =
  A.object [ "@type" A..= T.String "deleteAccount", "reason" A..= reason ]
-- deleteAccount DeleteAccount  { reason :: String } 


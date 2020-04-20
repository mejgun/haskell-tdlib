-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteSavedOrderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data DeleteSavedOrderInfo = 
 DeleteSavedOrderInfo -- deriving (Show)

instance T.ToJSON DeleteSavedOrderInfo where
 toJSON (DeleteSavedOrderInfo {  }) =
  A.object [ "@type" A..= T.String "deleteSavedOrderInfo" ]
-- deleteSavedOrderInfo DeleteSavedOrderInfo 


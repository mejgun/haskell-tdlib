-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetSavedOrderInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetSavedOrderInfo = 
 GetSavedOrderInfo -- deriving (Show)

instance T.ToJSON GetSavedOrderInfo where
 toJSON (GetSavedOrderInfo {  }) =
  A.object [ "@type" A..= T.String "getSavedOrderInfo" ]
-- getSavedOrderInfo GetSavedOrderInfo 


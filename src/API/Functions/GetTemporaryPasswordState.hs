-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetTemporaryPasswordState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetTemporaryPasswordState = 
 GetTemporaryPasswordState -- deriving (Show)

instance T.ToJSON GetTemporaryPasswordState where
 toJSON (GetTemporaryPasswordState {  }) =
  A.object [ "@type" A..= T.String "getTemporaryPasswordState" ]
-- getTemporaryPasswordState GetTemporaryPasswordState 


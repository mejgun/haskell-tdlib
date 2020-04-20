-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetPasswordState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetPasswordState = 
 GetPasswordState -- deriving (Show)

instance T.ToJSON GetPasswordState where
 toJSON (GetPasswordState {  }) =
  A.object [ "@type" A..= T.String "getPasswordState" ]
-- getPasswordState GetPasswordState 


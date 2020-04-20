-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCurrentState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetCurrentState = 
 GetCurrentState -- deriving (Show)

instance T.ToJSON GetCurrentState where
 toJSON (GetCurrentState {  }) =
  A.object [ "@type" A..= T.String "getCurrentState" ]
-- getCurrentState GetCurrentState 


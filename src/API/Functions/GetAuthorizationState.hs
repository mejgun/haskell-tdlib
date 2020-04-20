-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetAuthorizationState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetAuthorizationState = 
 GetAuthorizationState -- deriving (Show)

instance T.ToJSON GetAuthorizationState where
 toJSON (GetAuthorizationState {  }) =
  A.object [ "@type" A..= T.String "getAuthorizationState" ]
-- getAuthorizationState GetAuthorizationState 


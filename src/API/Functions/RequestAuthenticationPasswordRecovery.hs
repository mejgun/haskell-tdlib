-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RequestAuthenticationPasswordRecovery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RequestAuthenticationPasswordRecovery = 
 RequestAuthenticationPasswordRecovery -- deriving (Show)

instance T.ToJSON RequestAuthenticationPasswordRecovery where
 toJSON (RequestAuthenticationPasswordRecovery {  }) =
  A.object [ "@type" A..= T.String "requestAuthenticationPasswordRecovery" ]
-- requestAuthenticationPasswordRecovery RequestAuthenticationPasswordRecovery 


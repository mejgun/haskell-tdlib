-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RequestPasswordRecovery where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data RequestPasswordRecovery = 
 RequestPasswordRecovery -- deriving (Show)

instance T.ToJSON RequestPasswordRecovery where
 toJSON (RequestPasswordRecovery {  }) =
  A.object [ "@type" A..= T.String "requestPasswordRecovery" ]
-- requestPasswordRecovery RequestPasswordRecovery 


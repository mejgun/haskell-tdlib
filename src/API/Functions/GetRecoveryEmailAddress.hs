-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetRecoveryEmailAddress where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

--main = putStrLn "ok"

data GetRecoveryEmailAddress = 
 GetRecoveryEmailAddress { password :: String }  -- deriving (Show)

instance T.ToJSON GetRecoveryEmailAddress where
 toJSON (GetRecoveryEmailAddress { password = password }) =
  A.object [ "@type" A..= T.String "getRecoveryEmailAddress", "password" A..= password ]
-- getRecoveryEmailAddress GetRecoveryEmailAddress  { password :: String } 



instance T.FromJSON GetRecoveryEmailAddress where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getRecoveryEmailAddress" -> parseGetRecoveryEmailAddress v
  where
   parseGetRecoveryEmailAddress :: A.Value -> T.Parser GetRecoveryEmailAddress
   parseGetRecoveryEmailAddress = A.withObject "GetRecoveryEmailAddress" $ \o -> do
    password <- o A..: "password"
    return $ GetRecoveryEmailAddress { password = password }
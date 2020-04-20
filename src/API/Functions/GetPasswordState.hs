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



instance T.FromJSON GetPasswordState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getPasswordState" -> parseGetPasswordState v
  where
   parseGetPasswordState :: A.Value -> T.Parser GetPasswordState
   parseGetPasswordState = A.withObject "GetPasswordState" $ \o -> do
    return $ GetPasswordState {  }
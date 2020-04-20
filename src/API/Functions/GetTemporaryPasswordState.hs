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



instance T.FromJSON GetTemporaryPasswordState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getTemporaryPasswordState" -> parseGetTemporaryPasswordState v
  where
   parseGetTemporaryPasswordState :: A.Value -> T.Parser GetTemporaryPasswordState
   parseGetTemporaryPasswordState = A.withObject "GetTemporaryPasswordState" $ \o -> do
    return $ GetTemporaryPasswordState {  }
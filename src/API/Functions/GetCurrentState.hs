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



instance T.FromJSON GetCurrentState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getCurrentState" -> parseGetCurrentState v
  where
   parseGetCurrentState :: A.Value -> T.Parser GetCurrentState
   parseGetCurrentState = A.withObject "GetCurrentState" $ \o -> do
    return $ GetCurrentState {  }
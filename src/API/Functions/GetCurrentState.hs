-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCurrentState where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data GetCurrentState = 
 GetCurrentState deriving (Show, Eq)

instance T.ToJSON GetCurrentState where
 toJSON (GetCurrentState {  }) =
  A.object [ "@type" A..= T.String "getCurrentState" ]

instance T.FromJSON GetCurrentState where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getCurrentState" -> parseGetCurrentState v
   _ -> mempty
  where
   parseGetCurrentState :: A.Value -> T.Parser GetCurrentState
   parseGetCurrentState = A.withObject "GetCurrentState" $ \o -> do
    return $ GetCurrentState {  }
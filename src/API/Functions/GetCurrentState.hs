-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCurrentState where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns all updates needed to restore current TDLib state, i.e. all actual UpdateAuthorizationState/UpdateUser/UpdateNewChat and others. This is especially useful if TDLib is run in a separate process. Can be called before initialization
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
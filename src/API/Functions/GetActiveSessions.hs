-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetActiveSessions where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

-- |
-- 
-- Returns all active sessions of the current user
data GetActiveSessions = 
 GetActiveSessions deriving (Show, Eq)

instance T.ToJSON GetActiveSessions where
 toJSON (GetActiveSessions {  }) =
  A.object [ "@type" A..= T.String "getActiveSessions" ]

instance T.FromJSON GetActiveSessions where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getActiveSessions" -> parseGetActiveSessions v
   _ -> mempty
  where
   parseGetActiveSessions :: A.Value -> T.Parser GetActiveSessions
   parseGetActiveSessions = A.withObject "GetActiveSessions" $ \o -> do
    return $ GetActiveSessions {  }
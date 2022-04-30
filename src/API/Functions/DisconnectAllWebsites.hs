-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DisconnectAllWebsites where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Disconnects all websites from the current user's Telegram account
data DisconnectAllWebsites = 

 DisconnectAllWebsites deriving (Eq)

instance Show DisconnectAllWebsites where
 show DisconnectAllWebsites {  } =
  "DisconnectAllWebsites" ++ U.cc [ ]

instance T.ToJSON DisconnectAllWebsites where
 toJSON DisconnectAllWebsites {  } =
  A.object [ "@type" A..= T.String "disconnectAllWebsites" ]

instance T.FromJSON DisconnectAllWebsites where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "disconnectAllWebsites" -> parseDisconnectAllWebsites v
   _ -> mempty
  where
   parseDisconnectAllWebsites :: A.Value -> T.Parser DisconnectAllWebsites
   parseDisconnectAllWebsites = A.withObject "DisconnectAllWebsites" $ \o -> do
    return $ DisconnectAllWebsites {  }
 parseJSON _ = mempty

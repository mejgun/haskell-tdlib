-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetDefaultChannelAdministratorRights where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.ChatAdministratorRights as ChatAdministratorRights

-- |
-- 
-- Sets default administrator rights for adding the bot to channel chats; for bots only 
-- 
-- __default_channel_administrator_rights__ Default administrator rights for adding the bot to channels; may be null
data SetDefaultChannelAdministratorRights = 

 SetDefaultChannelAdministratorRights { default_channel_administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights }  deriving (Eq)

instance Show SetDefaultChannelAdministratorRights where
 show SetDefaultChannelAdministratorRights { default_channel_administrator_rights=default_channel_administrator_rights } =
  "SetDefaultChannelAdministratorRights" ++ U.cc [U.p "default_channel_administrator_rights" default_channel_administrator_rights ]

instance T.ToJSON SetDefaultChannelAdministratorRights where
 toJSON SetDefaultChannelAdministratorRights { default_channel_administrator_rights = default_channel_administrator_rights } =
  A.object [ "@type" A..= T.String "setDefaultChannelAdministratorRights", "default_channel_administrator_rights" A..= default_channel_administrator_rights ]

instance T.FromJSON SetDefaultChannelAdministratorRights where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setDefaultChannelAdministratorRights" -> parseSetDefaultChannelAdministratorRights v
   _ -> mempty
  where
   parseSetDefaultChannelAdministratorRights :: A.Value -> T.Parser SetDefaultChannelAdministratorRights
   parseSetDefaultChannelAdministratorRights = A.withObject "SetDefaultChannelAdministratorRights" $ \o -> do
    default_channel_administrator_rights <- o A..:? "default_channel_administrator_rights"
    return $ SetDefaultChannelAdministratorRights { default_channel_administrator_rights = default_channel_administrator_rights }
 parseJSON _ = mempty

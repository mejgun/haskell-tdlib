-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetDefaultGroupAdministratorRights where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.ChatAdministratorRights as ChatAdministratorRights

-- |
-- 
-- Sets default administrator rights for adding the bot to basic group and supergroup chats; for bots only 
-- 
-- __default_group_administrator_rights__ Default administrator rights for adding the bot to basic group and supergroup chats; may be null
data SetDefaultGroupAdministratorRights = 

 SetDefaultGroupAdministratorRights { default_group_administrator_rights :: Maybe ChatAdministratorRights.ChatAdministratorRights }  deriving (Eq)

instance Show SetDefaultGroupAdministratorRights where
 show SetDefaultGroupAdministratorRights { default_group_administrator_rights=default_group_administrator_rights } =
  "SetDefaultGroupAdministratorRights" ++ cc [p "default_group_administrator_rights" default_group_administrator_rights ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SetDefaultGroupAdministratorRights where
 toJSON SetDefaultGroupAdministratorRights { default_group_administrator_rights = default_group_administrator_rights } =
  A.object [ "@type" A..= T.String "setDefaultGroupAdministratorRights", "default_group_administrator_rights" A..= default_group_administrator_rights ]

instance T.FromJSON SetDefaultGroupAdministratorRights where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setDefaultGroupAdministratorRights" -> parseSetDefaultGroupAdministratorRights v
   _ -> mempty
  where
   parseSetDefaultGroupAdministratorRights :: A.Value -> T.Parser SetDefaultGroupAdministratorRights
   parseSetDefaultGroupAdministratorRights = A.withObject "SetDefaultGroupAdministratorRights" $ \o -> do
    default_group_administrator_rights <- o A..:? "default_group_administrator_rights"
    return $ SetDefaultGroupAdministratorRights { default_group_administrator_rights = default_group_administrator_rights }
 parseJSON _ = mempty

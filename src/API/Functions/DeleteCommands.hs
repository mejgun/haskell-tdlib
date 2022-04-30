-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.DeleteCommands where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.BotCommandScope as BotCommandScope

-- |
-- 
-- Deletes commands supported by the bot for the given user scope and language; for bots only
-- 
-- __scope__ The scope to which the commands are relevant; pass null to delete commands in the default bot command scope
-- 
-- __language_code__ A two-letter ISO 639-1 language code or an empty string
data DeleteCommands = 

 DeleteCommands { language_code :: Maybe String, scope :: Maybe BotCommandScope.BotCommandScope }  deriving (Eq)

instance Show DeleteCommands where
 show DeleteCommands { language_code=language_code, scope=scope } =
  "DeleteCommands" ++ U.cc [U.p "language_code" language_code, U.p "scope" scope ]

instance T.ToJSON DeleteCommands where
 toJSON DeleteCommands { language_code = language_code, scope = scope } =
  A.object [ "@type" A..= T.String "deleteCommands", "language_code" A..= language_code, "scope" A..= scope ]

instance T.FromJSON DeleteCommands where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deleteCommands" -> parseDeleteCommands v
   _ -> mempty
  where
   parseDeleteCommands :: A.Value -> T.Parser DeleteCommands
   parseDeleteCommands = A.withObject "DeleteCommands" $ \o -> do
    language_code <- o A..:? "language_code"
    scope <- o A..:? "scope"
    return $ DeleteCommands { language_code = language_code, scope = scope }
 parseJSON _ = mempty

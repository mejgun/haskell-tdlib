-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetCommands where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.BotCommandScope as BotCommandScope

-- |
-- 
-- Returns the list of commands supported by the bot for the given user scope and language; for bots only
-- 
-- __scope__ The scope to which the commands are relevant; pass null to get commands in the default bot command scope
-- 
-- __language_code__ A two-letter ISO 639-1 language code or an empty string
data GetCommands = 

 GetCommands { language_code :: Maybe String, scope :: Maybe BotCommandScope.BotCommandScope }  deriving (Eq)

instance Show GetCommands where
 show GetCommands { language_code=language_code, scope=scope } =
  "GetCommands" ++ cc [p "language_code" language_code, p "scope" scope ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetCommands where
 toJSON GetCommands { language_code = language_code, scope = scope } =
  A.object [ "@type" A..= T.String "getCommands", "language_code" A..= language_code, "scope" A..= scope ]

instance T.FromJSON GetCommands where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getCommands" -> parseGetCommands v
   _ -> mempty
  where
   parseGetCommands :: A.Value -> T.Parser GetCommands
   parseGetCommands = A.withObject "GetCommands" $ \o -> do
    language_code <- o A..:? "language_code"
    scope <- o A..:? "scope"
    return $ GetCommands { language_code = language_code, scope = scope }
 parseJSON _ = mempty

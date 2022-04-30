-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SetMenuButton where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.BotMenuButton as BotMenuButton

-- |
-- 
-- Sets menu button for the given user or for all users; for bots only
-- 
-- __user_id__ Identifier of the user or 0 to set menu button for all users
-- 
-- __menu_button__ New menu button
data SetMenuButton = 

 SetMenuButton { menu_button :: Maybe BotMenuButton.BotMenuButton, user_id :: Maybe Int }  deriving (Eq)

instance Show SetMenuButton where
 show SetMenuButton { menu_button=menu_button, user_id=user_id } =
  "SetMenuButton" ++ U.cc [U.p "menu_button" menu_button, U.p "user_id" user_id ]

instance T.ToJSON SetMenuButton where
 toJSON SetMenuButton { menu_button = menu_button, user_id = user_id } =
  A.object [ "@type" A..= T.String "setMenuButton", "menu_button" A..= menu_button, "user_id" A..= user_id ]

instance T.FromJSON SetMenuButton where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "setMenuButton" -> parseSetMenuButton v
   _ -> mempty
  where
   parseSetMenuButton :: A.Value -> T.Parser SetMenuButton
   parseSetMenuButton = A.withObject "SetMenuButton" $ \o -> do
    menu_button <- o A..:? "menu_button"
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ SetMenuButton { menu_button = menu_button, user_id = user_id }
 parseJSON _ = mempty

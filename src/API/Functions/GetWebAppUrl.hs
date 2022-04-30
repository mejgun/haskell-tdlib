-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetWebAppUrl where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.ThemeParameters as ThemeParameters

-- |
-- 
-- Returns an HTTPS URL of a web app to open after keyboardButtonTypeWebApp button is pressed
-- 
-- __bot_user_id__ Identifier of the target bot
-- 
-- __url__ The URL from the keyboardButtonTypeWebApp button
-- 
-- __theme__ Preferred web app theme; pass null to use the default theme
data GetWebAppUrl = 

 GetWebAppUrl { theme :: Maybe ThemeParameters.ThemeParameters, url :: Maybe String, bot_user_id :: Maybe Int }  deriving (Eq)

instance Show GetWebAppUrl where
 show GetWebAppUrl { theme=theme, url=url, bot_user_id=bot_user_id } =
  "GetWebAppUrl" ++ U.cc [U.p "theme" theme, U.p "url" url, U.p "bot_user_id" bot_user_id ]

instance T.ToJSON GetWebAppUrl where
 toJSON GetWebAppUrl { theme = theme, url = url, bot_user_id = bot_user_id } =
  A.object [ "@type" A..= T.String "getWebAppUrl", "theme" A..= theme, "url" A..= url, "bot_user_id" A..= bot_user_id ]

instance T.FromJSON GetWebAppUrl where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getWebAppUrl" -> parseGetWebAppUrl v
   _ -> mempty
  where
   parseGetWebAppUrl :: A.Value -> T.Parser GetWebAppUrl
   parseGetWebAppUrl = A.withObject "GetWebAppUrl" $ \o -> do
    theme <- o A..:? "theme"
    url <- o A..:? "url"
    bot_user_id <- mconcat [ o A..:? "bot_user_id", readMaybe <$> (o A..: "bot_user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetWebAppUrl { theme = theme, url = url, bot_user_id = bot_user_id }
 parseJSON _ = mempty

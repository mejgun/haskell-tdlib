-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.DeepLinkInfo where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)
import {-# SOURCE #-} qualified API.FormattedText as FormattedText

-- |
-- 
-- Contains information about a tg: deep link 
-- 
-- __text__ Text to be shown to the user
-- 
-- __need_update_application__ True, if the user must be asked to update the application
data DeepLinkInfo = 

 DeepLinkInfo { need_update_application :: Maybe Bool, text :: Maybe FormattedText.FormattedText }  deriving (Eq)

instance Show DeepLinkInfo where
 show DeepLinkInfo { need_update_application=need_update_application, text=text } =
  "DeepLinkInfo" ++ cc [p "need_update_application" need_update_application, p "text" text ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON DeepLinkInfo where
 toJSON DeepLinkInfo { need_update_application = need_update_application, text = text } =
  A.object [ "@type" A..= T.String "deepLinkInfo", "need_update_application" A..= need_update_application, "text" A..= text ]

instance T.FromJSON DeepLinkInfo where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "deepLinkInfo" -> parseDeepLinkInfo v
   _ -> mempty
  where
   parseDeepLinkInfo :: A.Value -> T.Parser DeepLinkInfo
   parseDeepLinkInfo = A.withObject "DeepLinkInfo" $ \o -> do
    need_update_application <- o A..:? "need_update_application"
    text <- o A..:? "text"
    return $ DeepLinkInfo { need_update_application = need_update_application, text = text }
 parseJSON _ = mempty

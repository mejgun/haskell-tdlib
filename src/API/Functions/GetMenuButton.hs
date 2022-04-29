-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.GetMenuButton where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Returns menu button set by the bot for the given user; for bots only 
-- 
-- __user_id__ Identifier of the user or 0 to get the default menu button
data GetMenuButton = 

 GetMenuButton { user_id :: Maybe Int }  deriving (Eq)

instance Show GetMenuButton where
 show GetMenuButton { user_id=user_id } =
  "GetMenuButton" ++ cc [p "user_id" user_id ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON GetMenuButton where
 toJSON GetMenuButton { user_id = user_id } =
  A.object [ "@type" A..= T.String "getMenuButton", "user_id" A..= user_id ]

instance T.FromJSON GetMenuButton where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "getMenuButton" -> parseGetMenuButton v
   _ -> mempty
  where
   parseGetMenuButton :: A.Value -> T.Parser GetMenuButton
   parseGetMenuButton = A.withObject "GetMenuButton" $ \o -> do
    user_id <- mconcat [ o A..:? "user_id", readMaybe <$> (o A..: "user_id" :: T.Parser String)] :: T.Parser (Maybe Int)
    return $ GetMenuButton { user_id = user_id }
 parseJSON _ = mempty

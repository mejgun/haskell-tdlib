-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.MessageLink where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Contains an HTTPS link to a message in a supergroup or channel 
-- 
-- __link__ Message link
-- 
-- __is_public__ True, if the link will work for non-members of the chat
data MessageLink = 

 MessageLink { is_public :: Maybe Bool, link :: Maybe String }  deriving (Eq)

instance Show MessageLink where
 show MessageLink { is_public=is_public, link=link } =
  "MessageLink" ++ cc [p "is_public" is_public, p "link" link ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON MessageLink where
 toJSON MessageLink { is_public = is_public, link = link } =
  A.object [ "@type" A..= T.String "messageLink", "is_public" A..= is_public, "link" A..= link ]

instance T.FromJSON MessageLink where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "messageLink" -> parseMessageLink v
   _ -> mempty
  where
   parseMessageLink :: A.Value -> T.Parser MessageLink
   parseMessageLink = A.withObject "MessageLink" $ \o -> do
    is_public <- o A..:? "is_public"
    link <- o A..:? "link"
    return $ MessageLink { is_public = is_public, link = link }
 parseJSON _ = mempty

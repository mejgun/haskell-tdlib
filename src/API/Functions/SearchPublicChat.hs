-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SearchPublicChat where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Searches a public chat by its username. Currently, only private chats, supergroups and channels can be public. Returns the chat if found; otherwise an error is returned 
-- 
-- __username__ Username to be resolved
data SearchPublicChat = 

 SearchPublicChat { username :: Maybe String }  deriving (Eq)

instance Show SearchPublicChat where
 show SearchPublicChat { username=username } =
  "SearchPublicChat" ++ cc [p "username" username ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON SearchPublicChat where
 toJSON SearchPublicChat { username = username } =
  A.object [ "@type" A..= T.String "searchPublicChat", "username" A..= username ]

instance T.FromJSON SearchPublicChat where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "searchPublicChat" -> parseSearchPublicChat v
   _ -> mempty
  where
   parseSearchPublicChat :: A.Value -> T.Parser SearchPublicChat
   parseSearchPublicChat = A.withObject "SearchPublicChat" $ \o -> do
    username <- o A..:? "username"
    return $ SearchPublicChat { username = username }
 parseJSON _ = mempty

-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ClearAllDraftMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import Data.List (intercalate)

-- |
-- 
-- Clears draft messages in all chats 
-- 
-- __exclude_secret_chats__ If true, local draft messages in secret chats will not be cleared
data ClearAllDraftMessages = 

 ClearAllDraftMessages { exclude_secret_chats :: Maybe Bool }  deriving (Eq)

instance Show ClearAllDraftMessages where
 show ClearAllDraftMessages { exclude_secret_chats=exclude_secret_chats } =
  "ClearAllDraftMessages" ++ cc [p "exclude_secret_chats" exclude_secret_chats ]

p :: Show a => String -> Maybe a -> String
p b (Just a) = b ++ " = " ++ show a
p _ Nothing = ""

cc :: [String] -> String
cc [] = mempty
cc a = " {" ++ intercalate ", " (filter (not . null) a) ++ "}"


instance T.ToJSON ClearAllDraftMessages where
 toJSON ClearAllDraftMessages { exclude_secret_chats = exclude_secret_chats } =
  A.object [ "@type" A..= T.String "clearAllDraftMessages", "exclude_secret_chats" A..= exclude_secret_chats ]

instance T.FromJSON ClearAllDraftMessages where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "clearAllDraftMessages" -> parseClearAllDraftMessages v
   _ -> mempty
  where
   parseClearAllDraftMessages :: A.Value -> T.Parser ClearAllDraftMessages
   parseClearAllDraftMessages = A.withObject "ClearAllDraftMessages" $ \o -> do
    exclude_secret_chats <- o A..:? "exclude_secret_chats"
    return $ ClearAllDraftMessages { exclude_secret_chats = exclude_secret_chats }
 parseJSON _ = mempty

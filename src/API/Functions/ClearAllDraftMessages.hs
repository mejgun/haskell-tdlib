-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.ClearAllDraftMessages where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Clears message drafts in all chats 
-- 
-- __exclude_secret_chats__ Pass true to keep local message drafts in secret chats
data ClearAllDraftMessages = 

 ClearAllDraftMessages { exclude_secret_chats :: Maybe Bool }  deriving (Eq)

instance Show ClearAllDraftMessages where
 show ClearAllDraftMessages { exclude_secret_chats=exclude_secret_chats } =
  "ClearAllDraftMessages" ++ U.cc [U.p "exclude_secret_chats" exclude_secret_chats ]

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

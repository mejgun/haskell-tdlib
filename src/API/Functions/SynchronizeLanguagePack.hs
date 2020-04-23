-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.SynchronizeLanguagePack where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T

data SynchronizeLanguagePack = 
 SynchronizeLanguagePack { language_pack_id :: Maybe String }  deriving (Show)

instance T.ToJSON SynchronizeLanguagePack where
 toJSON (SynchronizeLanguagePack { language_pack_id = language_pack_id }) =
  A.object [ "@type" A..= T.String "synchronizeLanguagePack", "language_pack_id" A..= language_pack_id ]

instance T.FromJSON SynchronizeLanguagePack where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "synchronizeLanguagePack" -> parseSynchronizeLanguagePack v
   _ -> mempty
  where
   parseSynchronizeLanguagePack :: A.Value -> T.Parser SynchronizeLanguagePack
   parseSynchronizeLanguagePack = A.withObject "SynchronizeLanguagePack" $ \o -> do
    language_pack_id <- optional $ o A..: "language_pack_id"
    return $ SynchronizeLanguagePack { language_pack_id = language_pack_id }
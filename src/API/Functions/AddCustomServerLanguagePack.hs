-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddCustomServerLanguagePack where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- 
-- Adds a custom server language pack to the list of installed language packs in current localization target. Can be called before authorization 
-- 
-- __language_pack_id__ Identifier of a language pack to be added; may be different from a name that is used in an "https://t.me/setlanguage/" link
data AddCustomServerLanguagePack = 

 AddCustomServerLanguagePack { language_pack_id :: Maybe String }  deriving (Eq)

instance Show AddCustomServerLanguagePack where
 show AddCustomServerLanguagePack { language_pack_id=language_pack_id } =
  "AddCustomServerLanguagePack" ++ U.cc [U.p "language_pack_id" language_pack_id ]

instance T.ToJSON AddCustomServerLanguagePack where
 toJSON AddCustomServerLanguagePack { language_pack_id = language_pack_id } =
  A.object [ "@type" A..= T.String "addCustomServerLanguagePack", "language_pack_id" A..= language_pack_id ]

instance T.FromJSON AddCustomServerLanguagePack where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addCustomServerLanguagePack" -> parseAddCustomServerLanguagePack v
   _ -> mempty
  where
   parseAddCustomServerLanguagePack :: A.Value -> T.Parser AddCustomServerLanguagePack
   parseAddCustomServerLanguagePack = A.withObject "AddCustomServerLanguagePack" $ \o -> do
    language_pack_id <- o A..:? "language_pack_id"
    return $ AddCustomServerLanguagePack { language_pack_id = language_pack_id }
 parseJSON _ = mempty

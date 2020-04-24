-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.AddSavedAnimation where

import Control.Applicative (optional)
import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

data AddSavedAnimation = 
 AddSavedAnimation { animation :: Maybe InputFile.InputFile }  deriving (Show, Eq)

instance T.ToJSON AddSavedAnimation where
 toJSON (AddSavedAnimation { animation = animation }) =
  A.object [ "@type" A..= T.String "addSavedAnimation", "animation" A..= animation ]

instance T.FromJSON AddSavedAnimation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "addSavedAnimation" -> parseAddSavedAnimation v
   _ -> mempty
  where
   parseAddSavedAnimation :: A.Value -> T.Parser AddSavedAnimation
   parseAddSavedAnimation = A.withObject "AddSavedAnimation" $ \o -> do
    animation <- optional $ o A..: "animation"
    return $ AddSavedAnimation { animation = animation }
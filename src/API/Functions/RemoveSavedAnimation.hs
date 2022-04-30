-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveSavedAnimation where

import Text.Read (readMaybe)

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U
import {-# SOURCE #-} qualified API.InputFile as InputFile

-- |
-- 
-- Removes an animation from the list of saved animations 
-- 
-- __animation__ Animation file to be removed
data RemoveSavedAnimation = 

 RemoveSavedAnimation { animation :: Maybe InputFile.InputFile }  deriving (Eq)

instance Show RemoveSavedAnimation where
 show RemoveSavedAnimation { animation=animation } =
  "RemoveSavedAnimation" ++ U.cc [U.p "animation" animation ]

instance T.ToJSON RemoveSavedAnimation where
 toJSON RemoveSavedAnimation { animation = animation } =
  A.object [ "@type" A..= T.String "removeSavedAnimation", "animation" A..= animation ]

instance T.FromJSON RemoveSavedAnimation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeSavedAnimation" -> parseRemoveSavedAnimation v
   _ -> mempty
  where
   parseRemoveSavedAnimation :: A.Value -> T.Parser RemoveSavedAnimation
   parseRemoveSavedAnimation = A.withObject "RemoveSavedAnimation" $ \o -> do
    animation <- o A..:? "animation"
    return $ RemoveSavedAnimation { animation = animation }
 parseJSON _ = mempty

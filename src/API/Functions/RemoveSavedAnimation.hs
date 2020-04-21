-- GENERATED
{-# LANGUAGE OverloadedStrings #-}
module API.Functions.RemoveSavedAnimation where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import {-# SOURCE #-} qualified API.InputFile as InputFile

--main = putStrLn "ok"

data RemoveSavedAnimation = 
 RemoveSavedAnimation { animation :: InputFile.InputFile }  deriving (Show)

instance T.ToJSON RemoveSavedAnimation where
 toJSON (RemoveSavedAnimation { animation = animation }) =
  A.object [ "@type" A..= T.String "removeSavedAnimation", "animation" A..= animation ]



instance T.FromJSON RemoveSavedAnimation where
 parseJSON v@(T.Object obj) = do
  t <- obj A..: "@type" :: T.Parser String
  case t of
   "removeSavedAnimation" -> parseRemoveSavedAnimation v

   _ -> mempty ""
  where
   parseRemoveSavedAnimation :: A.Value -> T.Parser RemoveSavedAnimation
   parseRemoveSavedAnimation = A.withObject "RemoveSavedAnimation" $ \o -> do
    animation <- o A..: "animation"
    return $ RemoveSavedAnimation { animation = animation }